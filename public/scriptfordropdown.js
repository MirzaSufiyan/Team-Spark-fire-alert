document.addEventListener('DOMContentLoaded', () => {
    // Function to handle dropdown behavior
    function setupDropdown(selectBox) {
        const searchBox = selectBox.querySelector('.search-box');
        const optionsList = selectBox.querySelector('.options');
        const options = selectBox.querySelectorAll('.options li');
        const errorMessage = selectBox.querySelector('.error-message');
        const hiddenInput = selectBox.querySelector('input[type="hidden"]');

        // Show options when clicking on the search box
        searchBox.addEventListener('focus', () => {
            optionsList.style.display = 'block';
        });

        // Hide options when clicking outside the search box
        document.addEventListener('click', (event) => {
            if (!selectBox.contains(event.target)) {
                optionsList.style.display = 'none';
            }
        });

        // Event listener for search box input
        searchBox.addEventListener('input', () => {
            const searchTerm = searchBox.value.trim().toLowerCase();

            options.forEach(option => {
                const text = option.textContent.trim().toLowerCase();
                if (text.includes(searchTerm)) {
                    option.style.display = 'block';
                } else {
                    option.style.display = 'none';
                }
            });
        });

        // Event listener for selecting an option
        options.forEach(option => {
            option.addEventListener('click', () => {
                const value = option.getAttribute('data-value');
                searchBox.value = option.textContent.trim();
                hiddenInput.value = value;
                optionsList.style.display = 'none'; // Hide options after selection
                errorMessage.style.display = 'none'; // Hide error message on valid selection
            });
        });
    }

    // Initialize dropdowns
    const selectBoxes = document.querySelectorAll('.selectBox');
    selectBoxes.forEach(selectBox => {
        setupDropdown(selectBox);
    });

    // Prevent form submission if value is not in the options
    document.querySelector('form').addEventListener('submit', (event) => {
        let isValid = true;

        selectBoxes.forEach(selectBox => {
            const searchBox = selectBox.querySelector('.search-box');
            const options = selectBox.querySelectorAll('.options li');
            const errorMessage = selectBox.querySelector('.error-message');
            const selectedValue = searchBox.value.trim().toLowerCase();
            let isOptionValid = false;

            options.forEach(option => {
                const text = option.textContent.trim().toLowerCase();
                if (text === selectedValue) {
                    isOptionValid = true;
                }
            });

            if (!isOptionValid) {
                isValid = false;
                searchBox.classList.add('invalid'); // Add a visual indicator for invalid selection
                errorMessage.style.display = 'block'; // Show error message for invalid selection
            } else {
                searchBox.classList.remove('invalid');
                errorMessage.style.display = 'none'; // Hide error message for valid selection
            }
        });

        if (!isValid) {
            event.preventDefault();
        }
    });
});
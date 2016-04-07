1. Who: Cameron Taylor, (Steven) Jace Conflenti, Callie Jones, Alex Luo, Alex Walling

2. Title: BuffBurgers

3. Vision: Faster Farrand burgers for Buffs, without the inconvenience of waiting in line.

4. Use Case ID: UC-01

    1. Use Case Name: Create an Account

    2. Description: Client is able to create a new account using their email and a password.

    3. Users: Clients

    4. Pre-conditions: Email has not been used to create an account before.

    5. Post-conditions: Client successfully attains an account and has the ability to log in later.

    6. Frequency of Use: On first use of the website/app

    7. Flow of Events:

        1. Actor Acton:

            1. Open the app

            2. Click on "Don’t have an account? Sign up." button.

            3. User puts in their email address and a password (twice), and clicks on the ‘Create Your Account’ button.

            4. User presses button under ‘confirm your email’.

        2. System Response:

            5. Login is displayed

            6. BuffBurgers Sign Up page

            7. User is created in the database, and app goes to Registration Confirmation page’

            8. User is taken to Recent Order page, as if they just signed in..

        3. Comments:

    8. Test Pass?:

    9. Notes and Issues:

5. Use Case ID: UC-02

    10. Use Case Name: Log In

    11. Description: Client is able to log in to the app using their email and password.

    12. Users: Client

    13. Pre-conditions: User previously created account.

    14. Post-conditions: User is able to view recent orders and place a new order.

    15. Frequency of Use: Every time after first log in.

    16. Flow of Events:

        4. Actor Acton:

            9. User enters emails and password into Log In screen, presses ‘Login’ button

        5. System Response:

            10. On a Successful login, app proceeds to ‘Recent Orders’ screen. On failure, the user is prompted with an error alert and asked to login again.

        6. Comments:

    17. Test Pass?:

    18. Notes and Issues:

6. Use Case ID: UC-03

    19. Use Case Name: Place New Order

    20. Description: Client can successfully place a new order for a customized burger.

    21. Users: Client

    22. Pre-conditions: Client has successfully created an account and is on ‘Recent Orders’ page.

    23. Post-conditions: Client and Provider can see the order and act on it.

    24. Frequency of Use: When hungry?

    25. Flow of Events:

        7. Actor Acton:

            11. User clicks on ‘Create a new order’ button.

            12. User uses dropdowns/checkboxes to select what condiments they want.

            13. User hits submit order button..

        8. System Response:

            14. App takes user to ‘Create an order’ page.

            15. App displays the selected items.

            16. App returns to recent order page where the new order (as well as older orders, if applicable) are visible.

        9. Comments:

    26. Test Pass?:

    27. Notes and Issues:

7. Use Case ID: UC-04

    28. Use Case Name: Recent Orders

    29. Description: Client is able to reorder a previous order.

    30. Users: Clients

    31. Pre-conditions:Client has created an order previously, client has logged into the app.

    32. Post-conditions: Client successfully orders the same or similar burger.

    33. Frequency of Use: When hungry for same thing.

    34. Flow of Events:

        10. Actor Acton:

            17. Click on the order they want to recreate.

            18. User makes adjustments if desired and hits the submit order button.

        11. System Response:

            19. App displays ‘New Order’ page with the same condiments filled out.

            20. App returns to recent order page where the new order is visible.

        12. Comments:

    35. Test Pass?:

    36. Notes and Issues:


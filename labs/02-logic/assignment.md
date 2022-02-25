# Lab 2: ADAM ONDREJKA

### 2-bit comparator

1. Karnaugh maps for other two functions:

   Greater than:

   ![K-maps](images/kmap_greater.png)

   Less than:

   ![K-maps](images/kmap_less.png)

2. Equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![Logic functions](images/comparator_min.png)

### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **xxxx15**

```vhdl
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        -- First test case
        s_b <= "0001";     -- ID = xxxx15
        s_a <= "0101";     -- ID = xxxx15
        wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A  = '1') and -- Intentional mistake, should be '0'
                (s_B_less_A    = '1'))
        -- If false, then report an error
        report "Input combination 0001,0101 FAILED" severity error;
        
        -- Second test case
        s_b <= "1001";
        s_a <= "1001";
        wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A  = '1') and
                (s_B_less_A    = '0'))
        -- If false, then report an error
        report "Input combination 1001,1001 FAILED" severity error;
        
        -- Third test case
        s_b <= "1111";
        s_a <= "0100";
        wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '1') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '0'))
        -- If false, then report an error
        report "Input combination 1111,0100 FAILED" severity error;

        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

2. Text console screenshot during your simulation, including reports.

   ![simulation reports](images/reports.png)

3. Link to your public EDA Playground example:

   [https://www.edaplayground.com/x/jHS8](https://www.edaplayground.com/x/jHS8)

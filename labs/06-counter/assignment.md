# Lab 6: ADAM ONDREJKA

### Bidirectional counter

1. Listing of VHDL code of the completed process `p_cnt_up_down`:

```vhdl
    --------------------------------------------------------
    -- p_cnt_up_down:
    -- Clocked process with synchronous reset which implements
    -- n-bit up/down counter.
    --------------------------------------------------------
    p_cnt_up_down : process(clk)
    begin
        if rising_edge(clk) then
        
            if (reset = '1') then   -- Synchronous reset
                s_cnt_local <= (others => '0'); -- Clear all bits

            elsif (en_i = '1') then -- Test if counter is enabled

                if (cnt_up_i = '1') then

                    s_cnt_local <= s_cnt_local + 1;
                
                else
                    
                    s_cnt_local <= s_cnt_local - 1;
                    
                end if;

            end if;
        end if;
    end process p_cnt_up_down;
```

2. Screenshot with simulated time waveforms.

   ![waveforms](images/waveforms.png)

### Two counters

1. Image of the top layer structure including both counters, ie a 4-bit bidirectional counter from *Part 4* and a 16-bit counter with a 10 ms time base from *Experiments on your own*:

   ![top2](images/top2_diagram.png)

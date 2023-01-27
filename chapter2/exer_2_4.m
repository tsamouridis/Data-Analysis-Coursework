clear variables; close all;

a_b_cases = [1 2; 0 1; -1 1];   % the different values for a and b stored 
                                % in the form [a b; a b; ...]
n = 1:2:1e4;
value1 = zeros(1, length(n));   %value1 = E[1/X]
value2 = zeros(1, length(n));   %value2 = 1/E[X]
subplot();

for jj = 1:3
    a = a_b_cases(jj, 1);   % E[1/X]
    b = a_b_cases(jj, 2);   % 1/E[X]
    for ii = 1:length(n)
        X = a + (b-a)*rand(1, n(ii)); % X ~ U[a,b]
        value1(ii) = mean(1./X);
        value2(ii) = 1/mean(X);
    end
    
    subplot(3,1,jj)
    plot(n, value1);
    hold on;
    plot(n, value2);
    title("X \in [" + a + ", " + b + "]")
    grid on
    legend('E[1/X]', '1/E[X]')
end

%% Συμπεράσματα
% Γενικά E[1/X] ~= 1/E[X]. Στην περίπτωση που η τμ Χ ανήκει στο διάστημα 
% [1, 2] οι δύο τιμές είναι κοντά (διαφορά στο δεύτερο δεκαδικό ψηφίο καθώς
% το n μεγαλώνει πολύ). Όμως για Χ στα [-1, 1] και [0,1] η διαφορά είναι 
% μεγαλύτερη και σε ορισμένες περιπτώσεις πολλές φορές μεγαλύτερη. Στο 
% [-1, 1] το 1/Ε[Χ] παρουσιάζει "spikes". Το ίδιο κάνει το E[1/X] στο [0, 1]




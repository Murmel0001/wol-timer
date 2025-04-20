import time
from wakeonlan import send_magic_packet
from datetime import datetime

# === CONFIG ===
MAC_ADDRESS = "00:11:22:33:44:55"     # Zielgerät MAC-Adresse
WAIT_MINUTES = 60                     # Wie lange der Container laufen soll

def main():
    print(f"[{datetime.now()}]  Sende Wake-on-LAN an {MAC_ADDRESS}...")
    send_magic_packet(MAC_ADDRESS)
    print(f"[{datetime.now()}]  Warten für {WAIT_MINUTES} Minuten...")
    time.sleep(WAIT_MINUTES * 60)
    print(f"[{datetime.now()}]  Container beendet sich jetzt.")

if __name__ == "__main__":
    main()

function onUse(cid, item, frompos, item2, topos)

    estatua1 = 3837 ---uniqueid da estatua na city 1
    estatua2 = 3838 ---uniqueid da estatua na city 2
    estatua3 = 3839 ---uniqueid da estatua na city 3
    estatua4 = 3840
    estatua5 = 3841
    estatua6 = 3842
    estatua7 = 3843
    estatua8 = 3844
    estatua9 = 3845
    estatua10 = 3846
    estatua11 = 3847 --olivine
    estatua12 = 3848 --mahogany
    estatua13 = 3849 --newbark
    estatua14 = 3850 --cherrygrove
    estatua15 = 3851 --violet
    estatua16 = 3852 --Blackthorn

    estatua = 3697 ---actionid das estatuas 


    if item.uid == estatua1 then
        doPlayerSetTown(cid, 10)
        doPlayerGiveItem(cid, 2160, 10)
        doPlayerSendTextMessage(cid,22,"Voce agora eh um cidadao de Pallet.")

    elseif  item.uid == estatua2 then
        doPlayerSetTown(cid, 1)
        doPlayerSendTextMessage(cid,22,"Voce agora eh um cidadao de Saffron.")

    elseif  item.uid == estatua3 then
        doPlayerSetTown(cid, 2)
        doPlayerSendTextMessage(cid,22,"Voce agora eh um cidadao de Cerulean.")

    elseif  item.uid == estatua4 then
        doPlayerSetTown(cid, 3)
        doPlayerSendTextMessage(cid,22,"Voce agora eh um cidadao de Celladon.")

    elseif  item.uid == estatua5 then
        doPlayerSetTown(cid, 4)
        doPlayerSendTextMessage(cid,22,"Voce agora eh um cidadao de Lavender.")

    elseif  item.uid == estatua6 then
        doPlayerSetTown(cid, 5)
        doPlayerSendTextMessage(cid,22,"Voce agora eh um cidadao de Vermilion.")

    elseif  item.uid == estatua7 then
        doPlayerSetTown(cid, 6)
        doPlayerSendTextMessage(cid,22,"Voce agora eh um cidadao de Fuchsia.")

    elseif  item.uid == estatua8 then
        doPlayerSetTown(cid, 7)
        doPlayerSendTextMessage(cid,22,"Voce agora eh um cidadao de Cinnabar.")

    elseif  item.uid == estatua9 then
        doPlayerSetTown(cid, 8)
        doPlayerSendTextMessage(cid,22,"Voce agora eh um cidadao de Viridian.")

    elseif  item.uid == estatua10 then
        doPlayerSetTown(cid, 9)
        doPlayerSendTextMessage(cid,22,"Voce agora eh um cidadao de Pewter.")

    elseif  item.uid == estatua11 then
        doPlayerSetTown(cid, 11)
        doPlayerSendTextMessage(cid,22,"Voce agora eh um cidadao de Olivine.")

    elseif  item.uid == estatua12 then
        doPlayerSetTown(cid, 12)
        doPlayerSendTextMessage(cid,22,"Voce agora eh um cidadao de Mahogany.")

    elseif  item.uid == estatua13 then
        doPlayerSetTown(cid, 13)
        doPlayerSendTextMessage(cid,22,"Voce agora eh um cidadao de Newbark.")

    elseif  item.uid == estatua14 then
        doPlayerSetTown(cid, 14)
        doPlayerSendTextMessage(cid,22,"Voce agora eh um cidadao de Cherrygrove.")

    elseif  item.uid == estatua15 then
        doPlayerSetTown(cid, 15)
        doPlayerSendTextMessage(cid,22,"Voce agora eh um cidadao de Violet.")

    elseif  item.uid == estatua16 then
        doPlayerSetTown(cid, 16)
        doPlayerSendTextMessage(cid,22,"Voce agora eh um cidadao de Blackthorn.")




    end
    return 1
end
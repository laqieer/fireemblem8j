	.syntax unified
	.set EraseSaveRankData, 0x080A83F8 + 1
	.set LoadAndVerfyRankData, 0x080A82DC + 1
	.set LoadBonusContentData, 0x080A8338 + 1
	.set sub_80A776C, 0x080A776C + 1
	.set sub_80A7828, 0x080A7828 + 1
	.set sub_80A78EC, 0x080A78EC + 1
	.set sub_80A886C, 0x080A886C + 1
	.set sub_80A8890, 0x080A8890 + 1
	.set sub_80A89C8, 0x080A89C8 + 1
	.set sub_80A89EC, 0x080A89EC + 1
	.set sub_80AB4B8, 0x080AB4B8 + 1
	.section .text.sub_80A8AEC, "ax", %progbits
@ sub_80A8AEC @ JP 0x080A8AEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A8AEC
	.thumb_func
sub_80A8AEC:
	push {lr}
	movs r0, #0
	bl sub_80A776C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A8AFE
	bl sub_80A7828
_080A8AFE:
	movs r0, #0
	bl LoadBonusContentData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A8B0E
	bl sub_80A78EC
_080A8B0E:
	movs r0, #0
	bl LoadAndVerfyRankData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A8B1E
	bl EraseSaveRankData
_080A8B1E:
	movs r0, #0
	bl sub_80A8890
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A8B2E
	bl sub_80A886C
_080A8B2E:
	movs r0, #0
	bl sub_80A89EC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A8B3E
	bl sub_80A89C8
_080A8B3E:
	bl sub_80AB4B8
	pop {r0}
	bx r0
	.align 2, 0


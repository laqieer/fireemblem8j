	.syntax unified
	.set CheckFlag, 0x080860D0 + 1
	.set ComputeChapterRankings, 0x080BB088 + 1
	.set NextRN, 0x08000B60 + 1
	.set StoreRNState, 0x08000C24 + 1
	.set sub_8031160, 0x08031160 + 1
	.set sub_80A8D94, 0x080A8D94 + 1
	.section .text.sub_8009CF8, "ax", %progbits
@ sub_8009CF8 @ JP 0x08009CF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009CF8
	.thumb_func
sub_8009CF8:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #2
_08009CFE:
	bl NextRN
	subs r4, #1
	cmp r4, #0
	bge _08009CFE
	ldr r0, _08009D38 @ =0x0300533E
	bl StoreRNState
	movs r0, #3
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08009D20
	ldr r0, _08009D3C @ =0x0202BCEC
	bl sub_80A8D94
_08009D20:
	bl ComputeChapterRankings
	ldr r0, _08009D3C @ =0x0202BCEC
	adds r1, r5, #0
	adds r1, #0x2a
	ldrb r1, [r1]
	strb r1, [r0, #0xe]
	bl sub_8031160
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08009D38: .4byte 0x0300533E
_08009D3C: .4byte 0x0202BCEC


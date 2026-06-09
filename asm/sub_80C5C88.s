	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.set PutNumber, 0x08004A90 + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8004B70, 0x08004B70 + 1
	.section .text.sub_80C5C88, "ax", %progbits
@ sub_80C5C88 @ JP 0x080C5C88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C5C88
	.thumb_func
sub_80C5C88:
	push {r4, r5, lr}
	ldr r4, _080C5CC8 @ =0x0202306E
	bl sub_8000CD8
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	movs r3, #0
	bl sub_8004B70
	adds r5, r4, #0
	subs r5, #0xf0
	bl GetPartyGoldAmount
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl PutNumber
	subs r4, #0xee
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C5CC8: .4byte 0x0202306E


	.syntax unified
	.set RegisterDataMove, 0x08001F64 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_80567B8, "ax", %progbits
@ sub_80567B8 @ JP 0x080567B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80567B8
	.thumb_func
sub_80567B8:
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, _080567D8 @ =0x06002000
	ldr r4, _080567DC @ =0x02017790
	adds r1, r4, #0
	bl sub_80D6394
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080567D8: .4byte 0x06002000
_080567DC: .4byte 0x02017790


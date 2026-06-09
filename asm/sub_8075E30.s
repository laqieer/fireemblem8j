	.syntax unified
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F98, 0x08003F98 + 1
	.section .text.sub_8075E30, "ax", %progbits
@ sub_8075E30 @ JP 0x08075E30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8075E30
	.thumb_func
sub_8075E30:
	push {r4, lr}
	ldr r4, _08075E64 @ =0x020176F0
	adds r0, r4, #0
	bl sub_8003CF8
	adds r0, r4, #0
	movs r1, #8
	bl sub_8003D84
	adds r0, r4, #0
	movs r1, #2
	bl sub_8003D90
	ldr r0, _08075E68 @ =0x02020110
	ldrh r1, [r0]
	adds r0, r4, #0
	bl sub_8003F98
	ldr r1, _08075E6C @ =0x02023E82
	adds r0, r4, #0
	bl PutText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075E64: .4byte 0x020176F0
_08075E68: .4byte 0x02020110
_08075E6C: .4byte 0x02023E82


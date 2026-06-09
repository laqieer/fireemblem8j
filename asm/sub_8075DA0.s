	.syntax unified
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F98, 0x08003F98 + 1
	.section .text.sub_8075DA0, "ax", %progbits
@ sub_8075DA0 @ JP 0x08075DA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8075DA0
	.thumb_func
sub_8075DA0:
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r5, r4, #3
	ldr r0, _08075DE8 @ =0x020176A0
	adds r5, r5, r0
	adds r0, r5, #0
	bl sub_8003CF8
	adds r0, r5, #0
	movs r1, #8
	bl sub_8003D84
	adds r0, r5, #0
	movs r1, #2
	bl sub_8003D90
	ldr r0, _08075DEC @ =0x02020114
	lsls r4, r4, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_8003F98
	ldr r0, _08075DF0 @ =0x080E69AC
	adds r4, r4, r0
	ldrh r1, [r4]
	lsls r1, r1, #1
	ldr r0, _08075DF4 @ =0x02023CAE
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075DE8: .4byte 0x020176A0
_08075DEC: .4byte 0x02020114
_08075DF0: .4byte 0x080E69AC
_08075DF4: .4byte 0x02023CAE


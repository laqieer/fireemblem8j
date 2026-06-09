	.syntax unified
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_8075DF8, "ax", %progbits
@ sub_8075DF8 @ JP 0x08075DF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8075DF8
	.thumb_func
sub_8075DF8:
	push {r4, lr}
	ldr r4, _08075E24 @ =0x020176E0
	adds r0, r4, #0
	bl sub_8003CF8
	ldr r0, _08075E28 @ =0x02020108
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
	ldr r1, _08075E2C @ =0x02023E6C
	adds r0, r4, #0
	bl PutText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075E24: .4byte 0x020176E0
_08075E28: .4byte 0x02020108
_08075E2C: .4byte 0x02023E6C


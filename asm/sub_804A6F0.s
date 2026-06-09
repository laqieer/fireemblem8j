	.syntax unified
	.set DisableMuCamera, 0x0807A910 + 1
	.set GetUnit, 0x08019108 + 1
	.set SetMuScreenPosition, 0x0807BBF8 + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_807AAB8, 0x0807AAB8 + 1
	.section .text.sub_804A6F0, "ax", %progbits
@ sub_804A6F0 @ JP 0x0804A6F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804A6F0
	.thumb_func
sub_804A6F0:
	push {r4, r5, lr}
	ldr r1, _0804A730 @ =0x03001810
	ldr r0, _0804A734 @ =0x0203DD8C
	ldrb r0, [r0, #4]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl sub_807A888
	ldr r5, _0804A738 @ =0x03001830
	str r0, [r5]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	subs r2, #1
	lsls r2, r2, #4
	bl SetMuScreenPosition
	ldr r0, [r5]
	bl DisableMuCamera
	ldr r0, [r5]
	movs r1, #3
	bl sub_807AAB8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804A730: .4byte 0x03001810
_0804A734: .4byte 0x0203DD8C
_0804A738: .4byte 0x03001830


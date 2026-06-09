	.syntax unified
	.set SetTextFont, 0x08003C68 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.section .text.sub_8049C94, "ax", %progbits
@ sub_8049C94 @ JP 0x08049C94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8049C94
	.thumb_func
sub_8049C94:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08049CB8 @ =0x02000C60
	bl SetTextFont
	ldr r0, _08049CBC @ =0x02000C78
	ldr r3, [r4, #0x54]
	movs r1, #0x80
	movs r2, #0
	bl sub_80043B8
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049CB8: .4byte 0x02000C60
_08049CBC: .4byte 0x02000C78


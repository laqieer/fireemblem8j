	.syntax unified
	.set sub_80034D0, 0x080034D0 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_8022B54, 0x08022B54 + 1
	.set sub_8022BA0, 0x08022BA0 + 1
	.set sub_80502F4, 0x080502F4 + 1
	.section .text.sub_8022AF8, "ax", %progbits
@ sub_8022AF8 @ JP 0x08022AF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022AF8
	.thumb_func
sub_8022AF8:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne _08022B18
	ldr r1, _08022B14 @ =0x000007D6
	adds r0, r5, #0
	bl sub_80502F4
	movs r0, #8
	b _08022B4C
	.align 2, 0
_08022B14: .4byte 0x000007D6
_08022B18:
	bl sub_80034D0
	movs r0, #4
	bl sub_8003508
	ldr r0, _08022B3C @ =0x03004DF0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08022B40
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8022BA0
	b _08022B48
	.align 2, 0
_08022B3C: .4byte 0x03004DF0
_08022B40:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8022B54
_08022B48:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08022B4C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0


	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.section .text.sub_804C670, "ax", %progbits
@ sub_804C670 @ JP 0x0804C670 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C670
	.thumb_func
sub_804C670:
	push {r4, r5, lr}
	ldr r0, _0804C6B8 @ =0x0203A4E8
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r4, r0, #0
	ldr r0, _0804C6BC @ =0x0203A568
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_8018E64
	cmp r0, #0
	bne _0804C6A0
	ldr r0, [r4, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r4, #0xc]
_0804C6A0:
	adds r0, r5, #0
	bl sub_8018E64
	cmp r0, #0
	bne _0804C6B2
	ldr r0, [r5, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r5, #0xc]
_0804C6B2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804C6B8: .4byte 0x0203A4E8
_0804C6BC: .4byte 0x0203A568


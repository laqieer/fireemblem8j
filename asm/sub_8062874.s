	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8062874, "ax", %progbits
@ sub_8062874 @ JP 0x08062874 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8062874
	.thumb_func
sub_8062874:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0806289C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080628A0 @ =0x08600BCC
	movs r1, #3
	bl sub_8002BCC
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne _080628A8
	ldr r0, _080628A4 @ =0x080E2962
	b _080628B6
	.align 2, 0
_0806289C: .4byte 0x0201774C
_080628A0: .4byte 0x08600BCC
_080628A4: .4byte 0x080E2962
_080628A8:
	cmp r5, #1
	bne _080628B4
	ldr r0, _080628B0 @ =0x080E29E6
	b _080628B6
	.align 2, 0
_080628B0: .4byte 0x080E29E6
_080628B4:
	ldr r0, _080628C0 @ =0x080E2A18
_080628B6:
	str r0, [r1, #0x48]
	cmp r5, #0
	bne _080628C8
	ldr r0, _080628C4 @ =0x0869CCAC
	b _080628D6
	.align 2, 0
_080628C0: .4byte 0x080E2A18
_080628C4: .4byte 0x0869CCAC
_080628C8:
	cmp r5, #1
	bne _080628D4
	ldr r0, _080628D0 @ =0x0869EDF8
	b _080628D6
	.align 2, 0
_080628D0: .4byte 0x0869EDF8
_080628D4:
	ldr r0, _080628E0 @ =0x0869EBD8
_080628D6:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080628E0: .4byte 0x0869EBD8


	.syntax unified
	.set sub_807A6CC, 0x0807A6CC + 1
	.section .text.sub_807A710, "ax", %progbits
@ sub_807A710 @ JP 0x0807A710 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807A710
	.thumb_func
sub_807A710:
	push {r4, lr}
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	ldr r0, _0807A744 @ =0x089264AC
	movs r1, #7
	bl sub_807A6CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0xfe
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r1, r1, r0
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	cmp r4, #0
	bgt _0807A734
	movs r4, #1
_0807A734:
	cmp r4, #0x14
	ble _0807A73A
	movs r4, #0x14
_0807A73A:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807A744: .4byte 0x089264AC


	.syntax unified
	.section .text.sub_80A40A0, "ax", %progbits
@ sub_80A40A0 @ JP 0x080A40A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A40A0
	.thumb_func
sub_80A40A0:
	push {lr}
	adds r3, r0, #0
	ldr r2, _080A40A8 @ =0x08A95650
	b _080A40C8
	.align 2, 0
_080A40A8: .4byte 0x08A95650
_080A40AC:
	ldr r0, [r2]
	cmp r3, r0
	bne _080A40C6
	cmp r1, #3
	ble _080A40BA
	ldr r0, [r2, #4]
	b _080A40D0
_080A40BA:
	cmp r1, #1
	ble _080A40C2
	ldr r0, [r2, #8]
	b _080A40D0
_080A40C2:
	ldr r0, [r2, #0xc]
	b _080A40D0
_080A40C6:
	adds r2, #0x10
_080A40C8:
	ldr r0, [r2]
	cmp r0, #0
	bne _080A40AC
	movs r0, #0
_080A40D0:
	pop {r1}
	bx r1


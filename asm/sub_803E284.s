	.syntax unified
	.set sub_80194BC, 0x080194BC + 1
	.set sub_803E2B0, 0x0803E2B0 + 1
	.section .text.sub_803E284, "ax", %progbits
@ sub_803E284 @ JP 0x0803E284 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803E284
	.thumb_func
sub_803E284:
	push {lr}
	ldr r0, _0803E2A8 @ =0x0203AA00
	adds r1, r0, #0
	adds r1, #0x7a
	ldrb r0, [r1]
	cmp r0, #0
	bne _0803E2A4
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0803E2AC @ =0x0202E4EC
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	bl sub_803E2B0
_0803E2A4:
	pop {r0}
	bx r0
	.align 2, 0
_0803E2A8: .4byte 0x0203AA00
_0803E2AC: .4byte 0x0202E4EC


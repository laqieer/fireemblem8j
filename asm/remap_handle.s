	.syntax unified
	.section .text.remap_handle, "ax", %progbits
@ remap_handle @ JP 0x080DA3E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global remap_handle
	.thumb_func
remap_handle:
	adds r2, r0, #0
	ldr r0, _080DA3FC @ =0x08BB8A74
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r3, #0xe
	ldrsh r0, [r0, r3]
	cmp r2, r0
	bne _080DA404
	ldr r0, _080DA400 @ =0x03002B34
	b _080DA42A
	.align 2, 0
_080DA3FC: .4byte 0x08BB8A74
_080DA400: .4byte 0x03002B34
_080DA404:
	ldr r0, [r1, #8]
	movs r3, #0xe
	ldrsh r0, [r0, r3]
	cmp r2, r0
	bne _080DA418
	ldr r0, _080DA414 @ =0x03002B38
	b _080DA42A
	.align 2, 0
_080DA414: .4byte 0x03002B38
_080DA418:
	ldr r0, [r1, #0xc]
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	cmp r2, r0
	beq _080DA428
	adds r0, r2, #0
	subs r0, #0x20
	b _080DA42C
_080DA428:
	ldr r0, _080DA430 @ =0x03002B3C
_080DA42A:
	ldr r0, [r0]
_080DA42C:
	bx lr
	.align 2, 0
_080DA430: .4byte 0x03002B3C


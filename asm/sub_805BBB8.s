	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_805BBB8, "ax", %progbits
@ sub_805BBB8 @ JP 0x0805BBB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805BBB8
	.thumb_func
sub_805BBB8:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805BBDC
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _0805BBD2
	bl Proc_End
_0805BBD2:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0805BBDC
	bl Proc_End
_0805BBDC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0


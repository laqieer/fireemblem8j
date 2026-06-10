	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_8006D90, "ax", %progbits
@ sub_8006D90 @ JP 0x08006D90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006D90
	.thumb_func
sub_8006D90:
	push {lr}
	adds r1, r0, #0
	ldr r0, _08006DB0 @ =0x085B90D4
	ldr r2, [r0]
	ldrb r0, [r2, #9]
	ldrb r3, [r2, #0xa]
	cmp r0, r3
	blo _08006DB8
	movs r0, #0
	strb r0, [r2, #0x12]
	ldr r0, _08006DB4 @ =0x085B9288
	bl Proc_StartBlocking
	movs r0, #1
	b _08006DC4
	.align 2, 0
_08006DB0: .4byte 0x085B90D4
_08006DB4: .4byte 0x085B9288
_08006DB8:
	ldrb r0, [r2, #0x15]
	cmp r0, #0
	bne _08006DC2
	movs r0, #1
	strb r0, [r2, #0x15]
_08006DC2:
	movs r0, #0
_08006DC4:
	pop {r1}
	bx r1


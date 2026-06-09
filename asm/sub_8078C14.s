	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8078C14, "ax", %progbits
@ sub_8078C14 @ JP 0x08078C14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078C14
	.thumb_func
sub_8078C14:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x50]
	adds r0, r1, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _08078C30
	adds r0, r1, #0
	bl Proc_End
	adds r0, r4, #0
	bl sub_8002DE4
_08078C30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0


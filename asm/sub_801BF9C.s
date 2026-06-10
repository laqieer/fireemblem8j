	.syntax unified
	.set WriteSuspendSave, 0x080AA460 + 1
	.section .text.sub_801BF9C, "ax", %progbits
@ sub_801BF9C @ JP 0x0801BF9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801BF9C
	.thumb_func
sub_801BF9C:
	push {lr}
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #1
	bne _0801BFB0
	movs r0, #4
	bl WriteSuspendSave
	movs r0, #0x17
	b _0801BFB2
_0801BFB0:
	movs r0, #8
_0801BFB2:
	pop {r1}
	bx r1
	.align 2, 0


	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_802EAC4, 0x0802EAC4 + 1
	.section .text.sub_801F520, "ax", %progbits
@ sub_801F520 @ JP 0x0801F520 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801F520
	.thumb_func
sub_801F520:
	push {r4, r5, lr}
	adds r1, r0, #0
	adds r4, r2, #0
	ldr r0, _0801F548 @ =0x085C34F0
	bl Proc_StartBlocking
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_802EAC4
	adds r2, r0, #0
	ldrb r0, [r2, #3]
	movs r1, #1
	eors r0, r1
	strb r0, [r2, #3]
	cmp r0, #0
	beq _0801F54C
	ldrb r0, [r2, #1]
	b _0801F54E
	.align 2, 0
_0801F548: .4byte 0x085C34F0
_0801F54C:
	ldrb r0, [r2]
_0801F54E:
	str r0, [r5, #0x2c]
	ldrb r0, [r2, #3]
	str r0, [r5, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0


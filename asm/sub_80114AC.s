	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80114AC, "ax", %progbits
@ sub_80114AC @ JP 0x080114AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80114AC
	.thumb_func
sub_80114AC:
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	cmp r0, #0
	bge _080114CC
	ldr r0, _080114C8 @ =0x085775CC
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _080114DE
	adds r0, r1, #0
	bl sub_8002DE4
	b _080114DE
	.align 2, 0
_080114C8: .4byte 0x085775CC
_080114CC:
	cmp r0, #0
	beq _080114DE
	subs r0, #1
	str r0, [r1, #0x30]
	cmp r0, #0
	bne _080114DE
	adds r0, r1, #0
	bl sub_8002DE4
_080114DE:
	pop {r0}
	bx r0
	.align 2, 0


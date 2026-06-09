	.syntax unified
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80190C0, "ax", %progbits
@ sub_80190C0 @ JP 0x080190C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80190C0
	.thumb_func
sub_80190C0:
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x1b]
	cmp r0, #0
	beq _080190DC
	ldr r1, _080190D8 @ =0x085C2A50
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	b _080190E0
	.align 2, 0
_080190D8: .4byte 0x085C2A50
_080190DC:
	ldr r0, _080190E8 @ =0x085C2A18
	ldr r0, [r0]
_080190E0:
	bl sub_8009FA8
	pop {r1}
	bx r1
	.align 2, 0
_080190E8: .4byte 0x085C2A18


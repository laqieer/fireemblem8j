	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set sub_80187B0, 0x080187B0 + 1
	.set sub_80257C4, 0x080257C4 + 1
	.section .text.sub_8023D70, "ax", %progbits
@ sub_8023D70 @ JP 0x08023D70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023D70
	.thumb_func
sub_8023D70:
	push {r4, lr}
	ldr r4, _08023D90 @ =0x03004DF0
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08023D8C
	adds r0, r2, #0
	movs r1, #0x1e
	bl sub_80187B0
	cmp r0, #0
	bge _08023D94
_08023D8C:
	movs r0, #3
	b _08023DAA
	.align 2, 0
_08023D90: .4byte 0x03004DF0
_08023D94:
	ldr r0, [r4]
	movs r1, #0x1e
	bl sub_80257C4
	bl GetSelectTargetCount
	movs r1, #3
	cmp r0, #0
	beq _08023DA8
	movs r1, #1
_08023DA8:
	adds r0, r1, #0
_08023DAA:
	pop {r4}
	pop {r1}
	bx r1


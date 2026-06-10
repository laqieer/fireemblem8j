	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set sub_80255C0, 0x080255C0 + 1
	.set sub_80255F4, 0x080255F4 + 1
	.section .text.sub_8023CD4, "ax", %progbits
@ sub_8023CD4 @ JP 0x08023CD4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023CD4
	.thumb_func
sub_8023CD4:
	push {r4, lr}
	ldr r4, _08023D04 @ =0x03004DF0
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08023D00
	adds r0, r2, #0
	bl sub_80255F4
	bl GetSelectTargetCount
	cmp r0, #0
	beq _08023D00
	ldr r0, [r4]
	bl sub_80255C0
	bl GetSelectTargetCount
	cmp r0, #0
	beq _08023D08
_08023D00:
	movs r0, #3
	b _08023D1C
	.align 2, 0
_08023D04: .4byte 0x03004DF0
_08023D08:
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #3
	beq _08023D1A
	movs r0, #1
	b _08023D1C
_08023D1A:
	movs r0, #2
_08023D1C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0


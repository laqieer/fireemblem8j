	.syntax unified
	.set sub_80255F4, 0x080255F4 + 1
	.set sub_80502F4, 0x080502F4 + 1
	.set sub_80507B0, 0x080507B0 + 1
	.section .text.sub_8023D24, "ax", %progbits
@ SupportCommandEffect @ JP 0x08023D24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SupportCommandEffect
	.thumb_func
SupportCommandEffect:
	push {lr}
	adds r2, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq _08023D4C
	ldr r0, _08023D44 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_80255F4
	ldr r0, _08023D48 @ =0x085C5858
	bl sub_80507B0
	movs r0, #7
	b _08023D58
	.align 2, 0
_08023D44: .4byte 0x03004DF0
_08023D48: .4byte 0x085C5858
_08023D4C:
	movs r1, #0xfa
	lsls r1, r1, #3
	adds r0, r2, #0
	bl sub_80502F4
	movs r0, #8
_08023D58:
	pop {r1}
	bx r1


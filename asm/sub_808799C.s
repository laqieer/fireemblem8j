	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.section .text.sub_808799C, "ax", %progbits
@ sub_808799C @ JP 0x0808799C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808799C
	.thumb_func
sub_808799C:
	push {lr}
	ldr r0, [r0, #0x14]
	adds r0, #0x4c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x50
	bne _080879CC
	bl sub_8000CD8
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080879E6
	bl sub_8000CD8
	adds r1, r0, #0
	movs r0, #1
	ands r1, r0
	movs r0, #3
	movs r2, #0
	bl BG_SetPosition
	b _080879E6
_080879CC:
	bl sub_8000CD8
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080879E6
	ldr r2, _080879EC @ =0x0202BCAC
	ldrh r1, [r2, #0xe]
	ldr r0, _080879F0 @ =0x0000FFFD
	ands r0, r1
	movs r1, #1
	eors r0, r1
	strh r0, [r2, #0xe]
_080879E6:
	pop {r0}
	bx r0
	.align 2, 0
_080879EC: .4byte 0x0202BCAC
_080879F0: .4byte 0x0000FFFD


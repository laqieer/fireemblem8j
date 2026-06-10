	.syntax unified
	.set CanStartMu, 0x0807B580 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8015E18, 0x08015E18 + 1
	.section .text.sub_800FE0C, "ax", %progbits
@ sub_800FE0C @ JP 0x0800FE0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800FE0C
	.thumb_func
sub_800FE0C:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldrh r1, [r4, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800FE3A
	ldr r0, _0800FE48 @ =0x085C29C8
	bl Proc_Find
	cmp r0, #0
	bne _0800FE4C
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_8015E18
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800FE4C
_0800FE3A:
	bl CanStartMu
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800FE4C
	movs r0, #1
	b _0800FE4E
	.align 2, 0
_0800FE48: .4byte 0x085C29C8
_0800FE4C:
	movs r0, #0
_0800FE4E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1


	.syntax unified
	.set GetMenuCursorPosition, 0x08050174 + 1
	.set Proc_GotoScript, 0x08002EAC + 1
	.set sub_804F5D4, 0x0804F5D4 + 1
	.set sub_8050418, 0x08050418 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.section .text.sub_80502A4, "ax", %progbits
@ sub_80502A4 @ JP 0x080502A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80502A4
	.thumb_func
sub_80502A4:
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	add r4, sp, #4
	mov r1, sp
	adds r2, r4, #0
	bl GetMenuCursorPosition
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_8050418
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_804F5D4
	ldr r0, _080502EC @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080502E2
	bl sub_808B2A4
	ldr r1, _080502F0 @ =0x085E0698
	adds r0, r5, #0
	bl Proc_GotoScript
_080502E2:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080502EC: .4byte 0x085775CC
_080502F0: .4byte 0x085E0698


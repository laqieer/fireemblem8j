	.syntax unified
	.set GetMenuCursorPosition, 0x08050174 + 1
	.set Proc_GotoScript, 0x08002EAC + 1
	.set sub_804F5D4, 0x0804F5D4 + 1
	.set sub_8050418, 0x08050418 + 1
	.section .text.sub_8050328, "ax", %progbits
@ sub_8050328 @ JP 0x08050328 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050328
	.thumb_func
sub_8050328:
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
	ldr r0, _08050368 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08050360
	ldr r1, _0805036C @ =0x085E0698
	adds r0, r5, #0
	bl Proc_GotoScript
_08050360:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08050368: .4byte 0x085775CC
_0805036C: .4byte 0x085E0698


	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_80045BC, "ax", %progbits
@ sub_80045BC @ JP 0x080045BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80045BC
	.thumb_func
sub_80045BC:
	push {lr}
	sub sp, #4
	movs r2, #0
	strb r2, [r0, #2]
	str r1, [sp]
	ldr r1, _080045E0 @ =0x02028E70
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	bl sub_80D65C0
	adds r1, r0, #0
	ldr r2, _080045E4 @ =0x01000200
	mov r0, sp
	bl sub_80D636C
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080045E0: .4byte 0x02028E70
_080045E4: .4byte 0x01000200


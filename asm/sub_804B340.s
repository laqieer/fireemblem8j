	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set SetMuMoveScript, 0x0807ABB4 + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_804A0D4, 0x0804A0D4 + 1
	.set sub_807B4C8, 0x0807B4C8 + 1
	.section .text.sub_804B340, "ax", %progbits
@ sub_804B340 @ JP 0x0804B340 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804B340
	.thumb_func
sub_804B340:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r5, _0804B39C @ =0x03001810
	ldr r4, _0804B3A0 @ =0x0203DD8C
	ldrb r0, [r4, #4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	ldr r1, _0804B3A4 @ =0x080DEFA6
	mov r0, sp
	movs r2, #2
	bl memcpy
	ldr r6, _0804B3A8 @ =0x03001830
	ldr r0, [r6, #4]
	bl sub_807B4C8
	ldrb r0, [r4, #5]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #2
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0xc]
	ldr r0, _0804B3AC @ =0x0300182C
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _0804B38E
	ldr r0, [r6]
	mov r1, sp
	bl SetMuMoveScript
	movs r0, #7
	strb r0, [r7, #0x10]
_0804B38E:
	bl sub_804A0D4
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B39C: .4byte 0x03001810
_0804B3A0: .4byte 0x0203DD8C
_0804B3A4: .4byte 0x080DEFA6
_0804B3A8: .4byte 0x03001830
_0804B3AC: .4byte 0x0300182C


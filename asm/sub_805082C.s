	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set UnlockGame, 0x08015394 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_805082C, "ax", %progbits
@ sub_805082C @ JP 0x0805082C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805082C
	.thumb_func
sub_805082C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _0805083E
	adds r0, r4, #0
	bl sub_80D65C0
_0805083E:
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08050850
	bl UnlockGame
_08050850:
	adds r0, r4, #0
	bl Proc_End
	ldr r0, [r4, #0x14]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0


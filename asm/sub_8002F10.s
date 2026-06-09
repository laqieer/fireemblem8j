	.syntax unified
	.set sub_80D65D4, 0x080D65D4 + 1
	.section .text.sub_8002F10, "ax", %progbits
@ sub_8002F10 @ JP 0x08002F10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8002F10
	.thumb_func
sub_8002F10:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r4, _08002F38 @ =0x02024E68
	movs r5, #0x3f
_08002F1A:
	adds r0, r4, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, r7
	bne _08002F2A
	adds r0, r4, #0
	bl sub_80D65D4
_08002F2A:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _08002F1A
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002F38: .4byte 0x02024E68


	.syntax unified
	.set sub_807CF7C, 0x0807CF7C + 1
	.section .text.sub_807D004, "ax", %progbits
@ sub_807D004 @ JP 0x0807D004 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807D004
	.thumb_func
sub_807D004:
	push {lr}
	ldr r0, _0807D024 @ =0x0203E1EC
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #1
	beq _0807D01A
	cmp r0, #2
	bne _0807D020
	movs r0, #1
	bl sub_807CF7C
_0807D01A:
	movs r0, #0
	bl sub_807CF7C
_0807D020:
	pop {r0}
	bx r0
	.align 2, 0
_0807D024: .4byte 0x0203E1EC


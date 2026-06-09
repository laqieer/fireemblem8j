	.syntax unified
	.set ShowMu, 0x0807BBF0 + 1
	.set sub_807AAB8, 0x0807AAB8 + 1
	.section .text.sub_804CF58, "ax", %progbits
@ sub_804CF58 @ JP 0x0804CF58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804CF58
	.thumb_func
sub_804CF58:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0804CF6C
	ldr r0, [r4, #0x30]
	bl sub_807AAB8
_0804CF6C:
	ldr r0, [r4, #0x30]
	bl ShowMu
	pop {r4}
	pop {r0}
	bx r0


	.syntax unified
	.set GetClassSMSId, 0x08018AA4 + 1
	.set sub_8026694, 0x08026694 + 1
	.section .text.sub_807A948, "ax", %progbits
@ sub_807A948 @ JP 0x0807A948 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807A948
	.thumb_func
sub_807A948:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x41
	ldrb r0, [r0]
	bl GetClassSMSId
	adds r4, #0x3c
	ldrb r1, [r4]
	bl sub_8026694
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0


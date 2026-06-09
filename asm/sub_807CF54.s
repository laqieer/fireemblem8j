	.syntax unified
	.set sub_808583C, 0x0808583C + 1
	.section .text.sub_807CF54, "ax", %progbits
@ sub_807CF54 @ JP 0x0807CF54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807CF54
	.thumb_func
sub_807CF54:
	push {lr}
	ldr r1, _0807CF78 @ =0x0203E1EC
	adds r0, r1, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #2
	bne _0807CF72
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldr r1, [r1, #0x14]
	ldr r1, [r1]
	ldrb r1, [r1, #4]
	bl sub_808583C
_0807CF72:
	pop {r0}
	bx r0
	.align 2, 0
_0807CF78: .4byte 0x0203E1EC


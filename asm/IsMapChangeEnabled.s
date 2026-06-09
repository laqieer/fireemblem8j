	.syntax unified
	.section .text.IsMapChangeEnabled, "ax", %progbits
@ IsMapChangeEnabled @ JP 0x0802E570 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global IsMapChangeEnabled
	.thumb_func
IsMapChangeEnabled:
	push {lr}
	adds r2, r0, #0
	ldr r1, _0802E578 @ =0x0203A610
	b _0802E58C
	.align 2, 0
_0802E578: .4byte 0x0203A610
_0802E57C:
	cmp r0, #3
	bne _0802E58A
	ldrb r0, [r1, #3]
	cmp r0, r2
	bne _0802E58A
	movs r0, #1
	b _0802E594
_0802E58A:
	adds r1, #8
_0802E58C:
	ldrb r0, [r1, #2]
	cmp r0, #0
	bne _0802E57C
	movs r0, #0
_0802E594:
	pop {r1}
	bx r1


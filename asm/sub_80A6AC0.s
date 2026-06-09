	.syntax unified
	.section .text.sub_80A6AC0, "ax", %progbits
@ sub_80A6AC0 @ JP 0x080A6AC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A6AC0
	.thumb_func
sub_80A6AC0:
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r1, _080A6AF4 @ =0x02014EF4
	ldr r0, [r1]
	cmp r4, r0
	bge _080A6AEC
	ldr r6, _080A6AF8 @ =0x02014F28
	adds r5, r1, #0
_080A6AD0:
	ldr r0, [r5]
	adds r0, r4, r0
	lsls r1, r4, #1
	adds r0, r0, r1
	adds r0, r0, r6
	ldrb r3, [r0]
	adds r2, r4, r6
	ldrb r1, [r2]
	strb r1, [r0]
	strb r3, [r2]
	adds r4, #1
	ldr r0, [r5]
	cmp r4, r0
	blt _080A6AD0
_080A6AEC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6AF4: .4byte 0x02014EF4
_080A6AF8: .4byte 0x02014F28


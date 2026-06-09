	.syntax unified
	.section .text.sub_8004470, "ax", %progbits
@ sub_8004470 @ JP 0x08004470 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8004470
	.thumb_func
sub_8004470:
	push {lr}
	adds r1, r0, #0
	movs r2, #0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08004496
	ldr r0, _0800449C @ =0x02028E70
	ldr r0, [r0]
	ldr r3, [r0, #4]
_08004482:
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	adds r1, #1
	ldrb r0, [r0, #5]
	adds r2, r2, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _08004482
_08004496:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800449C: .4byte 0x02028E70


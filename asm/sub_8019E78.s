	.syntax unified
	.set sub_802EAC4, 0x0802EAC4 + 1
	.section .text.sub_8019E78, "ax", %progbits
@ sub_8019E78 @ JP 0x08019E78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8019E78
	.thumb_func
sub_8019E78:
	push {r4, r5, r6, lr}
	movs r0, #0
	bl sub_802EAC4
	adds r3, r0, #0
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _08019EBE
	ldr r6, _08019EC4 @ =0x0202E4D4
	ldr r5, _08019EC8 @ =0x0202E4E8
_08019E8C:
	ldrb r0, [r3, #2]
	cmp r0, #0xb
	bne _08019EB6
	ldrb r1, [r3, #1]
	ldr r0, [r6]
	lsls r1, r1, #2
	adds r0, r1, r0
	ldrb r4, [r3]
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08019EB6
	ldr r0, [r5]
	adds r0, r1, r0
	ldr r2, [r0]
	adds r2, r2, r4
	ldrb r0, [r2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
_08019EB6:
	adds r3, #8
	ldrb r0, [r3, #2]
	cmp r0, #0
	bne _08019E8C
_08019EBE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08019EC4: .4byte 0x0202E4D4
_08019EC8: .4byte 0x0202E4E8


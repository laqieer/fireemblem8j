	.syntax unified
	.set sub_80502F4, 0x080502F4 + 1
	.section .text.sub_8024354, "ax", %progbits
@ sub_8024354 @ JP 0x08024354 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024354
	.thumb_func
sub_8024354:
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	adds r0, r2, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	beq _0802437C
	ldr r1, _08024378 @ =0x0203A954
	adds r0, r2, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r1, #0x12]
	movs r0, #6
	strb r0, [r1, #0x11]
	movs r0, #0x17
	b _08024386
	.align 2, 0
_08024378: .4byte 0x0203A954
_0802437C:
	ldr r1, _0802438C @ =0x000007D3
	adds r0, r3, #0
	bl sub_80502F4
	movs r0, #8
_08024386:
	pop {r1}
	bx r1
	.align 2, 0
_0802438C: .4byte 0x000007D3


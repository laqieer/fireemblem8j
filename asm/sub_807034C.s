	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8054C74, 0x08054C74 + 1
	.set sub_8070390, 0x08070390 + 1
	.set sub_8070440, 0x08070440 + 1
	.section .text.sub_807034C, "ax", %progbits
@ sub_807034C @ JP 0x0807034C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807034C
	.thumb_func
sub_807034C:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0807036C
	ldr r0, [r4, #0x5c]
	bl sub_8070390
	ldr r0, [r4, #0x5c]
	bl sub_8070440
	b _08070388
_0807036C:
	cmp r0, #3
	beq _08070374
	cmp r0, #0x11
	bne _0807037E
_08070374:
	ldr r0, [r4, #0x5c]
	movs r1, #5
	bl sub_8054C74
	b _08070388
_0807037E:
	cmp r0, #0x24
	bne _08070388
	adds r0, r4, #0
	bl sub_8002DE4
_08070388:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0


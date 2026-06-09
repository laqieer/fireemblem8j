	.syntax unified
	.set memcpy, 0x080D6908 + 1
	.set sub_80BD218, 0x080BD218 + 1
	.set sub_80BD304, 0x080BD304 + 1
	.section .text.sub_80BD4F8, "ax", %progbits
@ sub_80BD4F8 @ JP 0x080BD4F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BD4F8
	.thumb_func
sub_80BD4F8:
	push {r4, lr}
	sub sp, #0x38
	adds r4, r0, #0
	ldr r1, _080BD540 @ =0x081F5BF4
	mov r0, sp
	movs r2, #0x37
	bl memcpy
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	ldrh r0, [r4, #0x2a]
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080BD51C
	movs r0, #0
	strh r0, [r4, #0x2a]
_080BD51C:
	adds r0, r4, #0
	bl sub_80BD304
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080BD536
	adds r0, r4, #0
	bl sub_80BD218
_080BD536:
	add sp, #0x38
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BD540: .4byte 0x081F5BF4


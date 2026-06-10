	.syntax unified
	.set sub_803B99C, 0x0803B99C + 1
	.section .text.sub_803BFA4, "ax", %progbits
@ sub_803BFA4 @ JP 0x0803BFA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803BFA4
	.thumb_func
sub_803BFA4:
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r2, _0803BFCC @ =0x0202E4D8
	ldr r2, [r2]
	lsrs r1, r1, #0x16
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0x21
	beq _0803BFDA
	cmp r0, #0x21
	bgt _0803BFD0
	cmp r0, #3
	beq _0803BFE8
	b _0803BFEC
	.align 2, 0
_0803BFCC: .4byte 0x0202E4D8
_0803BFD0:
	cmp r0, #0x24
	beq _0803BFE8
	cmp r0, #0x37
	bne _0803BFEC
	b _0803BFE8
_0803BFDA:
	mov r0, sp
	bl sub_803B99C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803BFEC
_0803BFE8:
	movs r0, #1
	b _0803BFEE
_0803BFEC:
	movs r0, #0
_0803BFEE:
	add sp, #4
	pop {r1}
	bx r1


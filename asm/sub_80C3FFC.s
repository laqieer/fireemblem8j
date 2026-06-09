	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C3FFC, "ax", %progbits
@ sub_80C3FFC @ JP 0x080C3FFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C3FFC
	.thumb_func
sub_80C3FFC:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _080C4014
	ldr r0, _080C4010 @ =0x08AC1EB4
	b _080C4018
	.align 2, 0
_080C4010: .4byte 0x08AC1EB4
_080C4014:
	ldr r0, _080C402C @ =0x08AC1EB4
	movs r1, #3
_080C4018:
	bl sub_8002BCC
	adds r2, r0, #0
	cmp r4, #0
	bne _080C4034
	ldr r0, _080C4030 @ =0x03005270
	ldr r1, [r0, #8]
	str r1, [r2, #0x30]
	ldr r0, [r0, #0xc]
	b _080C4042
	.align 2, 0
_080C402C: .4byte 0x08AC1EB4
_080C4030: .4byte 0x03005270
_080C4034:
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #8
	str r0, [r2, #0x30]
	movs r1, #2
	ldrsh r0, [r4, r1]
	lsls r0, r0, #8
_080C4042:
	str r0, [r2, #0x34]
	cmp r5, #0
	bne _080C404E
	str r5, [r2, #0x38]
	str r5, [r2, #0x3c]
	b _080C405E
_080C404E:
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #8
	str r0, [r2, #0x38]
	movs r1, #2
	ldrsh r0, [r5, r1]
	lsls r0, r0, #8
	str r0, [r2, #0x3c]
_080C405E:
	ldr r0, [r2, #0x38]
	ldr r1, [r2, #0x30]
	subs r0, r0, r1
	str r0, [r2, #0x44]
	ldr r0, [r2, #0x3c]
	ldr r1, [r2, #0x34]
	subs r0, r0, r1
	str r0, [r2, #0x48]
	strh r6, [r2, #0x2a]
	adds r0, r2, #0
	adds r0, #0x40
	strb r7, [r0]
	adds r0, r2, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0


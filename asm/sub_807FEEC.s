	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_807FEEC, "ax", %progbits
@ sub_807FEEC @ JP 0x0807FEEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807FEEC
	.thumb_func
sub_807FEEC:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0807FF1C @ =0x08A142AC
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x2c]
	ldr r4, _0807FF20 @ =0x0203A954
	ldrb r1, [r4, #0x13]
	lsls r1, r1, #4
	ldr r3, _0807FF24 @ =0x0202BCAC
	movs r5, #0xc
	ldrsh r2, [r3, r5]
	subs r1, r1, r2
	str r1, [r0, #0x30]
	ldrb r1, [r4, #0x14]
	lsls r1, r1, #4
	movs r4, #0xe
	ldrsh r2, [r3, r4]
	subs r1, r1, r2
	str r1, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FF1C: .4byte 0x08A142AC
_0807FF20: .4byte 0x0203A954
_0807FF24: .4byte 0x0202BCAC

